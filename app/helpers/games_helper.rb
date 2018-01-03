module GamesHelper

  def systems_traduction
    @systems.reduce({}) do |total, s|
      total[t("game.systems.#{s}")] = s
      total
    end
  end

  def privacies_traduction
    @privacies.reduce({}) do |total, p|
      total[t("game.privacies.#{p}")] = p
      total
    end
  end
end
