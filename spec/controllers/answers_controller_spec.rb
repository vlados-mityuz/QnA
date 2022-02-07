require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer) }

  describe 'POST #create' do
    context 'with valid attrubutes' do
      it 'saves a new answer in the database' do
        expect { post :create, params: { question_id: question.id, answer: attributes_for(:answer) } }.to change(question.answers, :count).by(1)
      end

      it 'redirects to question view' do
        post :create, params: { question_id: question.id, answer: attributes_for(:answer) }
        expect(response).to redirect_to assigns(:question)
      end
    end

    context 'with invalid attrubutes' do
      it 'does not save the question' do
        expect { post :create, params: { question_id: question.id, answer: attributes_for(:answer, :invalid) } }.to_not change(Answer, :count)
      end

      it 're-renders new view' do
        post :create, params: { question_id: question.id, answer: attributes_for(:answer, :invalid) }
        expect(response).to render_template "questions/show"
      end
    end
  end
end