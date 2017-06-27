module MatchesHelper

  def is_selected?(objet_class, match_id)
objet_class.constantize.where(:match_id => match_id, :selected => 1).present?
  end

def selected_final(objet_class, match_id)
@html =''
@objet = objet_class.constantize.where(:match_id => match_id, :selected => 1)
if @objet.present?
 @objet.each do |objet|
   @html += '<b>' + objet.user.name + '</b></br>'
 end
end
raw @html
end


  def selected_list(objet_class, match_id)
    @one = 0
    @html = ''
    @objet = objet_class.constantize.where(:match_id => match_id)
    if @objet.present?
      @objet.each do |objet|
        if objet.selected ==1
          @html += '<b>'
          @one = 1
        end
        @html +=  objet.user.name
        if objet.selected ==1
          @html += ' </b>'
        end
        @html += '<br/>'
        if logged_in? && impro_admin?(current_user)
          if objet.selected == 0
            @html += link_to "selectionner", select_path(:user_id => objet.user.id, :match_id => match_id, :class => objet_class)
          else
            @html += link_to "enlever", deselect_path(:user_id => objet.user.id, :match_id => match_id, :class => objet_class)
          end
          @html += '<br/>'
        end
      end
      if @one ==1
        @html = '<td class="match">'+@html+'</td>'
      else
        @html = '<td>'+ @html+ '</td>'
      end
    else
      @html += "<td>Pas encore d'inscrits</td>"
    end
    raw @html
  end
end
