class ProposalMailer < ApplicationMailer
  default from: 'joesnarl@gmail.com'
  layout 'mailer'
  ## TODO:  need to create a LC email with loose security restrictions to default email

  def proposal_mail(project, proposal)
    @project = project
    @proposal = proposal
    # instance variables needed for email views = clients? and proposal (but proposal should be tied to client so maybe just client)
    #@client =  params[:client]
    # @url = link for specific proposal - link helper?
    mail(to: 'joe@lunarcollective.co', subject: 'Lunar Collective Proposal Review')
  end
end
