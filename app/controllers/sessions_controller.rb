class SessionsController < Devise::SessionsController
  def new
    locals = { resource: User.new, resource_name: :user }
    render turbo_stream: turbo_stream.replace('sign-in-form', partial: 'devise/sessions/form', locals: locals)
  end
end
