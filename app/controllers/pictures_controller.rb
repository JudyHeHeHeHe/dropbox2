class PicturesController < ApplicationController

 def index
  @user = User.find(params[:user_id])
  @pictures = @user.pictures
 end

 def new
  @user = User.find(params[:user_id])
  @picture = Picture.new(:user => @user)
 end

 def create
  @user = User.find(params[:user_id])
  @picture = Picture.new(picture_params)
  @picture.user = @user
  uploadedPic = params[:picture][:image]
   if uploadedPic != nil
      t = Time.now
      ext = File.extname(uploadedPic.original_filename)
      savename = "file_#{t.strftime("%Y%m%d%H%M")}" + ext
      @picture.filename = uploadedPic.original_filename
      @picture.savefilename = savename
      savepath = Rails.root.join('public', 'images', savename)

      File.open(savepath, 'wb') do |file|
      file.write(uploadedPic.read)
      end
   end
   if @picture.save
      redirect_to user_pictures_path
   else
      render :new
   end
 end

 def edit
  @user = User.find(params[:user_id])
  @picture = @user.pictures.find(params[:id])
 end

 def update
  @user = User.find(params[:user_id])
  id = params[:id]
  @picture = @user.pictures.find(id)

   if @picture.update(picture_params)
      redirect_to user_pictures_path
   else
      render :edit
   end
 end

 def destroy
  @user = User.find(params[:user_id])
  pic = @user.pictures.find(params[:id])
  if pic != nil
     filename = Rails.root.join('public', 'images', pic.savefilename)
     File.delete(filename) if File.exist?(filename)
     pic.destroy
  end
     redirect_to user_pictures_path
 end

 private
 def picture_params
 params.require(:picture).permit(:description)
 end
end
