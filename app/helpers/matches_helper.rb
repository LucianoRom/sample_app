module MatchesHelper

  def selected_list(objet_class, match_id)
    @html = ''
    @objet = objet_class.constantize.where(:match_id => match_id)
    if @objet.present?
      @objet.each do |objet|
        if objet.selected ==1
          @html += '<b>'
        end
        @html +=  objet.user.name
        if objet.selected ==1
          @html += ' </b>'
        end
        @html += '<br/>'
        if logged_in? && current_user.admin?
          if objet.selected == 0
            @html += link_to "selectionner", select_path(:user_id => objet.user.id, :match_id => match_id, :class => objet_class)
          else
            @html += link_to "enlever", deselect_path(:user_id => objet.user.id, :match_id => match_id, :class => objet_class)
          end
          @html += '<br/>'
        end
      end
    else
      @html += "Pas encore d'inscrits"
    end
    raw @html
  end
end
