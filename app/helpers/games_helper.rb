module GamesHelper

  def systems_traduction
    @systems.reduce({}) do |total, s|
      total[t("game.systems.#{s}")] = s
      total
    end
  end

  def privacies_traduction
    @privacies.reduce({}) do |total, p|
      total[t("privacies.#{p}")] = p
      total
    end
  end

  def show_note?(note)
    return true unless note.privacy != 'Public'
    if note.privacy == 'Restrict'
      if note.game.master == current_user || note.user == current_user
        return true
      end
    else
      return true unless note.user != current_user
    end
  end
end
