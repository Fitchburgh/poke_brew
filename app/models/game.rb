class Game < ApplicationRecord
  def self.destroy
    redirect_to destroy_localstore_path
  end

  def destroy_localstore
  end
end
