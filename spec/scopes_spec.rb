RSpec.describe "Disallow/scopes" do

  describe "disallow scopes" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end

      model do
        has_many :messages
      end
    end

    it "no callback" do
      expect{ Post.disallow_default_scope! }.not_to raise_error
    end

    it "disallow default scope" do
      Post.default_scopes = { where.not(title: nil) }
      expect{ Post.disallow_default_scope! }.to raise_error
    end
  end
end
