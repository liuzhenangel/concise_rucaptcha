require 'spec_helper'

describe ConciseRuCaptcha do
  describe '.generate' do
    it 'should work' do
      res = ConciseRuCaptcha.generate()
      expect(res.length).to eq(2)
      expect(res[0].length).to eq(5)
      expect(res[1]).not_to eq(nil)
    end
  end

  describe '.create' do
    it 'should len equal config.len' do
      res = ConciseRuCaptcha.create(0)
      expect(res.length).to eq(2)
      expect(res[0].length).to eq(5)
      expect(res[1]).not_to eq(nil)
    end

    it 'should work with color style' do
      res = ConciseRuCaptcha.create(1)
      expect(res.length).to eq(2)
      expect(res[0].length).to eq(5)
      expect(res[1]).not_to eq(nil)
    end
  end
end
