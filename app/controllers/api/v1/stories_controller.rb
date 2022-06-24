class Api::V1::StoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :find_story, only: [:show, :update, :destroy]
  def index
    @stories = Story.all
    # render json: @stories
  end

  def show
  end

  def update
    if @story.update(story_params)
      render 'show'
    else
      render_error
    end
  end

  def created
    @story = Story.new(story_params)
    if @story.save
      render 'show', status: :created
    else
      render_error
    end
  end

  def destroy
    @story.destroy
    head :on_content
    # nothing to be returned
  end

  private

  def find_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:name, :title, :image)
  end

  def render_error
    render json: {erros: @story.errors.full_messages}
  end
end
