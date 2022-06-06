class SessionsController < Devise::SessionsController
  def new
    respond_to do |format|
      format.html { super }
      format.turbo_stream  do
        # When sign in fails devise redirects to new path using turbo_stream format
        # To update the sign in form with errors we use turbo_stream.replace
        locals = { resource: User.new, resource_name: :user }
        render turbo_stream: turbo_stream.replace('sign-in-form', partial: 'devise/sessions/form', locals: locals)
      end
    end
  end
end
