RSpec.describe Disallow do
  it "has a version number" do
    expect(Disallow::VERSION).not_to be nil
  end

  context "with simple Post model" do
    with_model :Post, scope: :all do
      table do |t|
        t.string :title
        t.timestamps null: false
      end

      model do
        disallow_validations!
        default_scope { where(title: "test") }

        validates :title, presence: true
        validate :validate_empty_string


        if __callbacks[:validate].present?
          raise Disallow::Error
        end
      end
    end

    before do
      bindind.irb
    end
    it "hello" do
    end
  end
end
