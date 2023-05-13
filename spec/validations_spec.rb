RSpec.describe "Disallow/validations" do

  describe "disallow validation" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end

      model do
        def validate_title
          errors.add(:title) if title == "bad"
        end
      end
    end

    it "no validation" do
      expect{ Post.disallow_validations! }.not_to raise_error(Disallow::Error)
    end

    it "disallow `validates`" do
      Post.validates(:name, presence: true)
      expect{ Post.disallow_validations! }.to raise_error(Disallow::Error)
    end

    it "disallow `validate`" do
      Post.validate(:validate_title)
      expect{ Post.disallow_validations! }.to raise_error(Disallow::Error)
    end

    it "disallow `validates_associated`" do
    end
  end
end
