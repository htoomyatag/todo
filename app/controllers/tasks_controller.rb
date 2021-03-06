class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  # GET /tasks
  # GET /tasks.json


   def change_stage
       @task = Task.find(params[:id])
       @testcoworker = @task.coworker.scan(/\d/).map(&:to_i)
      if  @testcoworker.include? current_user.id or current_user.id == @task.user_id
        @task.update(:tstage => params[:choice_status])
      else
         format.html { redirect_to dashboard_path, notice: 'Only creator and team members can edit the status!' }
      end
   end


  def dashboard
       @tasks = Task.all
       if params[:id].nil?
         @task = Task.new
         @taskform = "Add New Task"
       else
         @task = Task.find(params[:id])
         @taskform = "Edit Task"
       end
  end

  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to dashboard_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|

      if current_user.id == @task.user_id
        if  @task.update(task_params)
          format.html { redirect_to dashboard_path, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      else
          format.html { redirect_to dashboard_path, notice: 'Only creator can edit the title. description, due date, team members and categories.' }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    if current_user.id == @task.user_id 

      @task.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end

    else
       redirect_to dashboard_path, notice: 'Only creator can DELETE the task' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :duedate, :tstage, :user_id, :coworker => [], :tcategories => [])
    end
end
