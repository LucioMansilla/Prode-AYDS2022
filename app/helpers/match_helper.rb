module MatchHelperModule

  def create_match
    match = Match.new
    match.datetime = params['datetime']
    match.match_type = params['match_type']
    match.match_day_id = params['match_day_id']
    match.home_id = params['home_id']
    match.away_id = params['away_id']

    if(match.save)
      flash[:success] = "Partido creado con exito."
    else
      flash[:error] = "Error al crear partido. Intente nuevamente."
    end
    redirect '/matches'
  end

  def update_match

    match = Match.find_by_id(params[:match_id])
    match.result = params['result']
    match.home_goals = params['home_goals']
    match.away_goals = params['away_goals']
    match.datetime = params['datetime']

    if(match.home_goals != nil && match.home_goals != nil)
      if(!match.consistentResult)
        flash[:error] = "Error. El resultado no es consistente"
        redirect 'matches/update?match_id=' + params[:match_id]
      end
    end

    if(match.save)
      flash[:success] = "Partido actualizado con exito."
    else
      flash[:error] = "Error al actualizar partido. Intente nuevamente."
    end
    redirect 'matches/update?match_id=' + params[:match_id]

  end

  def matches 
    @tournaments = Tournament.all 

    if(params['id_tournament'])
      @torneo_selected = true
      @selected_tournament = Tournament.find_by_id(params['id_tournament'])
      @match_days = MatchDay.where(tournament_id: params['id_tournament'])
    end

    if(params['id_match_day'])
      @match_day_selected = true
      @matches = Match.where(match_day_id: params['id_match_day'])
      @match_day_tournament = MatchDay.find_by_id(params['id_match_day'])
    end

    erb :"admin/crud_match", :layout => :layout_2
  end


  def delete_match
    match = Match.find_by_id(params['match_id'])
    if (match.destroy)
      flash[:success] = "Partido eliminado con exito."
    else
      flash[:error] = "Error al eliminar partido. Intente nuevamente."
    end
    redirect '/matches'

  end

  def update_result
    @match = Match.find_by_id [params['match_id']]
    erb :'/admin/update_match', :layout => :layout_2
  end

end