class User < ActiveRecord::Base
  def getRank param_id
    return VeryBuilding.where(:user_id=>param_id).count
  end
end
