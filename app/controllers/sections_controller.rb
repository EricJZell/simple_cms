class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(page_id: @page.id)
    @sections_count = Section.count + 1
    @pages = @page.subject.pages.sorted
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section Created Successfully"
      redirect_to(action: :index, page_id: @page.id)
    else
      @sections_count = Section.count + 1
      @pages = Page.sorted
      render(:new)
    end
  end

  def edit
    @section = Section.find(params[:id])
    @sections_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section Updated Successfully"
      redirect_to(action: :show, id: @section.id, page_id: @page.id)
    else
      @sections_count = Section.count
      @pages = Page.sorted
      render(:edit)
    end
  end


  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section Deleted"
    redirect_to(action: :index, page_id: @page.id)
  end

  private

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end
end
