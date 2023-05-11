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
        default_scope { where(title: "test") }

        validates :title, presence: true
        validate :validate_empty_string


        before_save do
          puts "Test"
        end

        before_update :validate_empty_string

        disallow_before_save_callback!


        def validate_empty_string
        end
      end
    end

    let!(:post) { Post.create!(title: "My very first post") }

    it "hello" do
    end
  end
end
