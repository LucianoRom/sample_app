module MatchesHelper

def jour(date)
   @jour = "Lu " if date.wday == 1
   @jour = "Ma " if date.wday == 2
   @jour = "Me " if date.wday == 3
   @jour = "Je " if date.wday == 4
   @jour = "Ve " if date.wday == 5
   @jour = "Sa " if date.wday == 6
   @jour = "Di " if date.wday == 0
   @jour += date.mday.to_s
   @jour
end

def mois(date)
   @mois = "JANVIER" if date.mon ==1
   @mois = "FEVRIER" if date.mon ==2
   @mois = "MARS" if date.mon ==3
   @mois = "AVRIL" if date.mon ==4
   @mois = "MAI" if date.mon ==5
   @mois = "JUIN" if date.mon ==6
   @mois = "JUILLET" if date.mon ==7
   @mois = "AOUT" if date.mon ==8
   @mois = "SEPTEMBRE" if date.mon ==9
   @mois = "OCTOBRE" if date.mon ==10
   @mois = "NOVEMBRE" if date.mon ==11
   @mois = "DECEMBRE" if date.mon ==12
   @mois
end

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
