class ProposalsController < ApplicationController
  def show
    @proposal = Proposal.find_by(slug: params[:slug])
  end

  def new
    @project = Project.find_by(slug: params[:project_slug])
    @proposal = Proposal.new
  end

  def edit
    @project = Project.find_by(slug: params[:project_slug])
    @proposal = Proposal.find_by(slug: params[:slug])
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @project = @proposal.project

    if @proposal.save
      flash[:notice] = 'Successfully created proposal'
      redirect_to project_proposal_path(@proposal.project, @proposal)
    else
      flash[:warn] = 'Proposal failed to save'
      render 'new'
    end
  end

  def update
    @project = Project.find_by(slug: params[:project_slug])
    @proposal = Proposal.find_by(slug: params[:slug])

    if @proposal.update(proposal_params)
      redirect_to project_proposal_path(@proposal.project, @proposal)
    else
      render 'edit'
    end
  end

  def destroy
    @proposal = Proposal.find_by(slug: params[:slug])

    if @proposal.destroy
      redirect_to project_path(@proposal.project)
    else
      flash[:warn] = 'Proposal failed to delete'
    end
  end

  def send_email
    @project = Project.find_by(slug: params[:project_slug])
    @proposal = Proposal.find_by(slug: params[:slug])
    # @client = Client.find(@proposal.client_id)
    ProposalMailer.proposal_mail(@project, @proposal).deliver_now
    flash[:notice] = 'Proposal Email Successfully Sent to [@client.email] for [@client.name]'
    redirect_to project_proposal_path(@proposal.project, @proposal)
  end

  private
  def proposal_params
    params.require(:proposal).permit(:prepared_for, :prepared_by, :date_created, :project_goals, :project_implementation, :project_outline, :estimate, :proposed_start_date, :project_id, :name)
  end
end
