require 'spec_helper'

describe ConciseRuCaptcha do
  describe 'normal' do
    it 'should read right config with spec_helper set' do
      expect(ConciseRuCaptcha.config.expires_in).to eq(2.minutes)
    end
  end
end
