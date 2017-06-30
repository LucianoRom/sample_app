module MicropostsHelper
  def timeago_fr(time)
    a = (Time.now-time).to_i

    case a
    when 0 then "à l'instant"
    when 1 then "il y a une seconde"
    when 2..59 then "il y a "+a.to_s+' secondes'
    when 60..119 then 'il y a une minute' #120 = 2 minutes
    when 120..3540 then 'il y a ' + (a/60).to_i.to_s+' minutes'
    when 3541..7100 then 'il y a une heure' # 3600 = 1 hour
    when 7101..82800 then 'il y a '+ ((a+99)/3600).to_i.to_s+' heures'
    when 82801..172000 then 'hier' # 86400 = 1 day
    when 172001..518400 then 'il y a '+((a+800)/(60*60*24)).to_i.to_s+' jours'
    when 518400..1036800 then 'la semaine dernière'
    else 'il y a '+((a+180000)/(60*60*24*7)).to_i.to_s+' semaines'
    end
  end
end
