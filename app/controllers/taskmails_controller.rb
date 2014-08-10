# coding: utf-8
class TaskmailsController < ApplicationController
  before_action :set_taskmail, only: [:show, :edit, :update, :destroy]

  # GET /taskmails
  # GET /taskmails.json
  def index
    redirect_to new_taskmail_path
  end

  # GET /taskmails/1
  # GET /taskmails/1.json
  def show
  end

  # GET /taskmails/new
  def new
  # coding: utf-8
    test="test"
    Mail.defaults do
      delivery_method(:smtp,
        address:  "smtp.gmail.com",
        port: 587,
        domain: 'slup-blog.herokuapp.com',
        user_name: 'exp.sei16@gmail.com',
        password: '10169022',
        authentication: 'plain',
        enable_starttls_auto: true)
    end
    # example.co.jpサーバ宛てにメールを送信
    Mail.deliver do
      from    "exp.sei16@gmail.com"
      to      "exp.sei16@gmail.com"
      subject "subject text"
      body    test
    end
    @taskmail=Taskmail.getNewMail(@current_user)
  end

  # GET /taskmails/1/edit
  def edit
  end

  # POST /taskmails
  # POST /taskmails.json
  def create
    @taskmail = Taskmail.new(taskmail_params)
    respond_to do |format|
      Appsetup.sendmail(@taskmail)
      if @taskmail.save
        format.html { redirect_to @taskmail, notice: 'Taskmail was successfully created.' }
      #  format.json { render :show, status: :created, location: @taskmail }
      else
        format.html { render :new }
      #  format.json { render json: @taskmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taskmails/1
  # PATCH/PUT /taskmails/1.json
  def update
    respond_to do |format|
      if @taskmail.update(taskmail_params)
        format.html { redirect_to @taskmail, notice: 'Taskmail was successfully updated.' }
        format.json { render :show, status: :ok, location: @taskmail }
      else
        format.html { render :edit }
        format.json { render json: @taskmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taskmails/1
  # DELETE /taskmails/1.json
  def destroy
    @taskmail.destroy
    respond_to do |format|
      format.html { redirect_to taskmails_url, notice: 'Taskmail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taskmail
      @taskmail = Taskmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taskmail_params
      params.require(:taskmail).permit(:from, :address, :cc, :bcc, :subject, :header, :text, :footer, :status, :type)
    end
end
