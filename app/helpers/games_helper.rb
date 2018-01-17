module GamesHelper

  def systems_traduction
    @systems.reduce({}) do |total, s|
      total[t("game.systems.#{s}")] = s
      total
    end
  end

  def privacies_traduction(type)
    if type == 'g'
      @game_privacies.reduce({}) do |total, p|
        total[t("privacies.#{p}")] = p
        @resp = total
      end
    end
    if type == 'n'
      @note_privacies.reduce({}) do |total, p|
        total[t("privacies.#{p}")] = p
        @resp = total
      end
    end
    @resp
  end

  def show_note?(note)
    return true unless note.privacy != 'public'
    if note.privacy == 'restrict'
      if note.game.master == current_user || note.user == current_user
        return true
      end
    else
      return true unless note.user != current_user
    end
  end
end
