RSpec.describe "Disallow/scopes" do

  describe "disallow scopes" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end

      model do
        has_many :messages
        default_scope { where.not(title: nil) }
      end
    end

    it "no callback" do
      expect{ Post.disallow_default_scopes! }.not_to raise_error(Disallow::Error)
    end

    it "disallow default scope" do
      expect{ Post.disallow_default_scopes! }.to raise_error(Disallow::Error)
    end
  end
end
