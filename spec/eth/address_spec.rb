describe Eth::Address do
  describe "#valid?" do
    context "given an address with a valid checksum" do
      let(:addresses) do
        [
          "0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed",
          "0xfB6916095ca1df60bB79Ce92cE3Ea74c37c5d359",
          "0xdbF03B407c01E7cD3CBea99509d93f8DDDC8C6FB",
          "0xD1220A0cf47c7B9Be7A2E6BA89F429762e7b9aDb",
        ]
      end

      it "returns true" do
        addresses.each do |address|
          expect(Eth::Address.new address).to be_valid
        end
      end
    end

    context "given an address with an invalid checksum" do
      let(:addresses) do
        [
          "0x5AAeb6053F3E94C9b9A09f33669435E7Ef1BeAed",
          "0xFB6916095ca1df60bB79Ce92cE3Ea74c37c5d359",
          "0xDbF03B407c01E7cD3CBea99509d93f8DDDC8C6FB",
          "0xd1220A0cf47c7B9Be7A2E6BA89F429762e7b9aDb",
        ]
      end

      it "returns false" do
        addresses.each do |address|
          expect(Eth::Address.new address).not_to be_valid
        end
      end
    end

    context "given an address with all uppercase letters" do
      let(:addresses) do
        [
          "0x5AAEB6053F3E94C9B9A09F33669435E7EF1BEAED",
          "0xFB6916095CA1DF60BB79CE92CE3EA74C37C5D359",
          "0xDBF03B407C01E7CD3CBEA99509D93F8DDDC8C6FB",
          "0xD1220A0CF47C7B9BE7A2E6BA89F429762E7B9ADB",
        ]
      end

      it "returns true" do
        addresses.each do |address|
          expect(Eth::Address.new address).to be_valid
        end
      end
    end

    context "given an address with all uppercase letters" do
      let(:addresses) do
        [
          "0x5aaeb6053f3e94c9b9a09f33669435e7ef1beaed",
          "0xfb6916095ca1df60bb79ce92ce3ea74c37c5d359",
          "0xdbf03b407c01e7cd3cbea99509d93f8dddc8c6fb",
          "0xd1220a0cf47c7b9be7a2e6ba89f429762e7b9adb",
        ]
      end

      it "returns true" do
        addresses.each do |address|
          expect(Eth::Address.new address).to be_valid
        end
      end
    end
  end
end
