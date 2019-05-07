# Preview all emails at http://localhost:3000/rails/mailers/proposal_mailer
class ProposalMailerPreview < ActionMailer::Preview
  def proposal_mail
    ProposalMailer.with(project: Project.first, proposal: Proposal.first).proposal_mail
  end
end
