# require 'rails_helper'
#
# describe MoviController, type: :controller do
#   describe 'with employer logged in' do
#     before(:each) do
#       @candidate_user = FactoryGirl.create(:user)
#       @employer_user =  FactoryGirl.create(:user)
#       urs = FactoryGirl.create(:user_role_status, user: @candidate_user)
#       @conversation = FactoryGirl.create(:conversation, user_role_status: urs)
#
#       @employer_user.add_role(:employer, @conversation.user_role_status.company_role.company)
#
#       @message1 = FactoryGirl.create(:message, conversation: @conversation, sender: @employer_user)
#       @message2_body = 'This is NOT a test!'
#       @message2 = FactoryGirl.create(:message ,conversation: @conversation,
#                                     body: @message2_body, sender: @candidate_user)
#       @message2.attachment = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'factories', 'fixtures', 'test_pdf.pdf'))
#       @message2.save!
#       @composite_score = @conversation.user_role_status.match_item.composite_score.decorate
#       @candidate_number = "Candidate " + @composite_score.try(:candidate_number)
#       @company_name = @conversation.user_role_status.company_role.company.name
#       @status = @conversation.user_role_status.user.decorate.status_text
#       login_with @employer_user
#     end
#
#     it 'GET #index' do
#       expect(Conversation).to receive(:get_inbox)
#
#       get :index
#       expect(response.status).to eq 200
#       expect(controller.current_user).to eq(@employer_user)
#     end
#
#     it 'GET #show' do
#       # expect(Conversation).to receive(:prepare_messages_json)
#       ##not sure i need this?
#       get :show, params: { conversation_id: @conversation.id }
#       expect(response.status).to eq 200
#       expect(controller.instance_variable_get(:@messages)[:messages].count).to eq(2)
#       expect(controller.current_user).to eq(@employer_user)
#     end
#
#     it 'PUT #update without attachment' do
#       message_body = 'This is a new message!'
#       put :update, params: { conversation_id: @conversation.id, body: message_body }
#       expect(response.status).to eq 200
#       expect(controller.instance_variable_get(:@messages)[:messages].last[:body]).to eq(message_body)
#       expect(response.content_type).to eq("application/json")
#       expect(controller.current_user).to eq(@employer_user)
#     end
#
#     it 'PUT #update with attachment' do
#       message_body = 'This is another new message!'
#       file = Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/fixtures/test_doc.docx')))
#       put :update, params: { conversation_id: @conversation.id, body: message_body, file: file }
#       expect(response.status).to eq 200
#       expect(controller.instance_variable_get(:@messages)[:messages].last[:body]).to eq(message_body)
#       expect(controller.instance_variable_get(:@messages)[:messages].last[:attachment]).not_to be_empty
#       expect(response.content_type).to eq('application/json')
#     end
#
#     it 'GET #get_archived_candidates' do
#       expect(UserRoleStatus).to receive(:prepare_json_for_archived)
#       get :get_archived_candidates
#       expect(response.status).to eq 200
#       expect(response.content_type).to eq('application/json')
#     end
#   end
# end
