# frozen_string_literal: true

RSpec.describe RailsDominantColors::Path do
  let(:rdc_path) do
    RailsDominantColors.path('spec/assets/image.png')
  end

  it 'Returns hex(a) values' do
    hexs = rdc_path.to_hex
    expect(hexs).to be_a_kind_of(Array)
    hex = hexs[0].gsub('#', '')
    expect(hex.to_i(16).to_s(16)).to eql(hex.downcase)

    hexas = rdc_path.to_hex_alpha
    expect(hexas).to be_a_kind_of(Array)
    hexa = hexas[0].gsub('#', '')
    expect(hexa.to_i(16).to_s(16)).to eql(hexa.downcase)
  end

  it 'Returns rgb(a) values' do
    rgbs = rdc_path.to_rgb
    expect(rgbs).to be_a_kind_of(Array)
    rgb = rgbs[0]
    expect(rgb.size).to eql(3)

    rgbas = rdc_path.to_rgb_alpha
    expect(rgbas).to be_a_kind_of(Array)
    rgba = rgbas[0]
    expect(rgba.size).to eql(4)
  end

  it 'Returns hsl(a) values' do
    hsls = rdc_path.to_hsl
    expect(hsls).to be_a_kind_of(Array)
    hsl = hsls[0]
    expect(hsl.size).to eql(3)

    hslas = rdc_path.to_hsl_alpha
    expect(hslas).to be_a_kind_of(Array)
    hsla = hslas[0]
    expect(hsla.size).to eql(4)
  end

  it 'Returns pct values' do
    pcts = rdc_path.to_pct
    expect(pcts.sum).to be >= 99.99
  end

  it 'Returns raises errors' do
    expect do
      RailsDominantColors.path('')
    end.to raise_error(RailsDominantColors::Base::EmptySource)

    expect do
      RailsDominantColors.path('spec/assets/image.jpg')
    end.to raise_error(RailsDominantColors::Base::FileNotFound)

    expect do
      RailsDominantColors.path('spec/assets/image_base64.txt')
    end.to raise_error(RailsDominantColors::Base::NotAnImage)
  end
end
