# RSpec.describe "Disallow/callbacks" do

#   describe "disallow callbacks" do
#     with_model :Post, scope: :all do
#       table do |t|
#         t.string :title
#         t.timestamps null: false
#       end

#       model do
#         has_many :messages
#         def validate_title
#           errors.add(:title) if title == "bad"
#         end
#       end
#     end

#     it "no callback" do
#       expect{ Post.disallow_callbacks! }.not_to raise_error(Disallow::Error)
#     end

#     it "disallow all callbacks" do
#       Post.before_save(Proc.new{})
#       expect{ Post.disallow_validations! }.to raise_error(Disallow::Error)
#     end

#     it "disallow specific callback" do
#       Post.validate(:validate_title)
#       expect{ Post.disallow_validations! }.to raise_error(Disallow::Error)
#     end
#   end
# end
