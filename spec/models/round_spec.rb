# == Schema Information
#
# Table name: rounds
#
#  id            :integer          not null, primary key
#  fight_id      :integer
#  player_damage :integer
#  bot_damage    :integer
#  status        :integer          default("active")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  player_hp     :integer
#  bot_hp        :integer
#

require 'spec_helper'

describe Round, type: :model do
  it { is_expected.to belong_to(:fight) }
end
