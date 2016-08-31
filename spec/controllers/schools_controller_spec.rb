 require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets instance variable schools' do 
      get :index
      expect(assigns(:schools)).to eq([])
    end

    it 'instance variable contains array of schools' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :index
      expect(assigns(:schools).count).to eq(1)
      expect(assigns(:schools).first.class).to eq(School)
    end

    it 'renders index template' do 
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :show, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'sets instance variable school' do
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :show, id: school.id
      expect(assigns(:school).name).to eq('Stanford')
    end

    it 'renders show template' do 
       school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :show, id: school.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'sets the school instance variable' do 
      get :new
      expect(assigns(:school)).to_not eq(nil)
    end

    it 'renders the new template' do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do 
    it 'successfuly creates a school' do 
      school_params = {school: {name: 'Stanford', rating: 6, level: 'Elementary'}}
      post :create, school_params
      expect(School.count).to eq(1)
      expect(assigns(:school).name).to eq(school_params[:school][:name])
    end

    it 'redirects to school_path on successful create' do 
     school_params = {school: {name: 'Stanford', rating: 6, level: 'Elementary'}}
      post :create, school_params
      expect(response).to redirect_to school_path(School.first)
    end

    it 'renders new template when create fails' do
    school_params = {school: {name: '', rating: 6, level: 'Elementary'}}
      post :create, school_params
      expect(response).to render_template(:new) 
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :edit, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'sets the school instance variable' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :edit, id: school.id
      expect(assigns(:school)).to eq(school)
    end

    it 'renders the edit template' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      get :edit, id: school.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do 
    it 'successfully updates a school' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      school_params = {name: 'updated_name'}
      put :update, {id: school.id, school: school_params}
      expect(assigns(:school).reload.name).to eq('updated_name')
    end

    it 'redirects to the school_path upon update' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      school_params = {name: 'updated_name'}
      put :update, {id: school.id, school: school_params}
      expect(response).to redirect_to school_path(School.first.id)
    end

    it 'renders edit template on failure' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      school_params = {name: ''}
      put :update, {id: school.id, school: school_params}
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do 
    it 'deletes a school' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      delete :destroy, id: school.id
      expect(School.all.count).to eq(0)
    end

    it 'redirects to schools_path' do 
      school = School.create(name: 'Stanford', rating: 6, level: 'Elementary')
      delete :destroy, id: school.id
      expect(response).to redirect_to(schools_path)
    end

  end

end
