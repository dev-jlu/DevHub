class ProjectsController < ApplicnoationController
  # Callback before show, update and destroy to get project by id
  before_action :set_project, only: [ :show, :update, :destroy ]

  # GET /projects
  def index
    @projects = Project.all
    render json: @projects
  end

  # GET /projects/:id
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/:id
  def destroy
    @project.destroy

    head :no_content
  end

  # --- PRIVATE METHODS ---
  private

  # Finds a Project by Id
  def set_project
    @project = Project.find(params[:id])
  end

  # Reads and validates params
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
