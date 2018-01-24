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

  def show_item?(item)
    return true unless item.privacy != 'public'
    if item.privacy == 'restrict'
      if item.game.master == current_user || item.user == current_user
        return true
      end
    else
      return true unless item.user != current_user
    end
  end
end
