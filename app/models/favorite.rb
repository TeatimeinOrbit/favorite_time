class Favorite < ApplicationRecord

  belongs_to :user_params
  belongs_to :posted_contents

end
