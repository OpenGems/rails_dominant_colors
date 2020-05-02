# frozen_string_literal: true

RSpec.describe RailsDominantColors::Base64 do
  let(:rdc_base) do
    file = File.open('spec/assets/image_base64.txt')
    RailsDominantColors.base64(file.read)
  end

  it 'Returns hex(a) values' do
    hexs = rdc_base.to_hex
    expect(hexs).to be_a_kind_of(Array)
    hex = hexs[0].gsub('#', '')
    expect(hex.to_i(16).to_s(16)).to eql(hex.downcase)

    hexas = rdc_base.to_hex_alpha
    expect(hexas).to be_a_kind_of(Array)
    hexa = hexas[0].gsub('#', '')
    expect(hexa.to_i(16).to_s(16)).to eql(hexa.downcase)
  end

  it 'Returns rgb(a) values' do
    rgbs = rdc_base.to_rgb
    expect(rgbs).to be_a_kind_of(Array)
    rgb = rgbs[0]
    expect(rgb.size).to eql(3)

    rgbas = rdc_base.to_rgb_alpha
    expect(rgbas).to be_a_kind_of(Array)
    rgba = rgbas[0]
    expect(rgba.size).to eql(4)
  end

  it 'Returns hsl(a) values' do
    hsls = rdc_base.to_hsl
    expect(hsls).to be_a_kind_of(Array)
    hsl = hsls[0]
    expect(hsl.size).to eql(3)

    hslas = rdc_base.to_hsl_alpha
    expect(hslas).to be_a_kind_of(Array)
    hsla = hslas[0]
    expect(hsla.size).to eql(4)
  end

  it 'Returns pct values' do
    pcts = rdc_base.to_pct
    expect(pcts.sum).to be >= 99.99
  end

  it 'Returns raises errors' do
    expect do
      RailsDominantColors.base64('')
    end.to raise_error(RailsDominantColors::Base::EmptySource)

    expect do
      RailsDominantColors.base64('test')
    end.to raise_error(RailsDominantColors::Base::InvalidBase64)
  end
end
