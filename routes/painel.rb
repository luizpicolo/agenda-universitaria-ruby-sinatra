get '/painel' do
    throw(redirect '/') unless session[:authenticated]
    @usuario = Usuario.first(:_id => session[:usuario]._id)
    erb :painel
end

get '/:usuario/painel' do
    throw(redirect '/') unless session[:authenticated]
    @usuario = Usuario.all(:usuario => params[:usuario]).first
    @tarefas = Tarefa.all(:id_usuario => @usuario._id.to_s, :visibilidade => 1, :order => :prioridade.asc, :order => :data_inicio.asc)
    erb :painel
end