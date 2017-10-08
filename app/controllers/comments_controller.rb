class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @collection = @comment.collection

    respond_to do |format|
      if @comment.save
        format.html { redirect_to collection_path(@collection), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
     @comment = Comment.find(params[:id])
     @collection = @comment.collection
     respond_to do |format|
       format.js { render :edit, local: { collection: @collection}  }
     end
  end

  def update
    @comment = Comment.find(params[:id])
    @collection = @comment.collection
    respond_to do |format|
      if @comment.update(comment_params)
        format.html{ redirect_to collection_path(@collection), notice: 'コメントを更新しました.' }
        format.js { render :index }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to collection_path(@collection), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:collection_id, :content)
    end
end
