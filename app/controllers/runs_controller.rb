class RunsController < ApplicationController

  MMF = MMFDataLoader.new

  def index
    @runs =         Run.all.reverse
    @run_targets =  RunTarget.all.reverse

    if @runs.any?
      RunAnalyzer.set_benchmark_from(@runs)
      TrainingPace.set_training_paces_using(RunAnalyzer)
      @training_paces = TrainingPace.all
    end
    
  end

  def new
    @run = Run.new
  end

  def create
    @run = Run.create_from(params)
    
    if @run.save
      redirect_to(runs_path)
    else 
      flash[:error] = @run.flash_error
      render :new
    end

  end

  def edit
    @run = Run.find(params[:id])
  end

  def update
    @run = Run.update_from(params)
    
    if @run
      redirect_to(runs_path)
    else  
      flash[:error] = @run.flash_error
      render :edit
    end
    
  end

  def destroy
    Run.find(params[:id]).delete
    redirect_to runs_path
  end

  def load_from_mmf
    MMF.save_my_workouts_to_db
    redirect_to runs_path
  end

  def new_link
    @run = Run.find(params[:id])
    @run_targets = RunTarget.all
  end

  def link_to_target
    Target.link_workout(params)
    redirect_to runs_path
  end

  def api_link_to_target
    Target.link_workout(params)
    render json: { status: 'OK'}
  end

  def graph_data
    render json: Run.generate_coordinates
  end

end
