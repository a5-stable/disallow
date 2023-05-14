RSpec.describe "Disallow/scopes" do

  context "no scope" do
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
  end

  context "with default_scope" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end

      model do
        default_scope { all }
        has_many :messages
      end
    end

    it "raises error" do
      expect{ Post.disallow_default_scope! }.to raise_error(Disallow::Scopes::DefaultScopesError)
    end
  end
end
