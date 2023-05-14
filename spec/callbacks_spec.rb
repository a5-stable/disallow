RSpec.describe "Disallow/callbacks" do

  context "no callback" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end
    end

    it "does not raise error without default scopes" do
      expect{ Post.disallow_before_save_callbacks! }.not_to raise_error
    end
  end

  context "with callback" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end

      model do
        before_save do |model|
          # do something
        end
      end
    end

    it "raises error" do
      expect{ Post.disallow_before_save_callbacks! }.to raise_error(Disallow::CallbackError)
      expect{ Post.disallow_callbacks! }.to raise_error(Disallow::CallbackError)
    end

    it "does not raise error with disallow other callbacks" do
      expect{ Post.disallow_after_save_callback! }.not_to raise_error(Disallow::CallbackError)
    end
  end
end
