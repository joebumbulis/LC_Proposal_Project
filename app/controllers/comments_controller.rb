class CommentsController < ApplicationController
  def create
    @proposal = Proposal.find(params[:proposal_id])
    @comment = @proposal.comments.create(comment_params)
    redirect_to project_proposal_path(@proposal.project, @proposal)
  end

  def destroy
    @proposal = Proposal.find(params[:proposal_id])
    @comment = @proposal.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Comment successfully deleted'
      redirect_to project_proposal_path(@proposal.project, @proposal)
    else
      flash[:warn] = 'Comment failed to delete'
      redirect_to project_proposal_path(@proposal.project, @proposal)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
