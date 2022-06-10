class PagesController< ApplicationController

    skip_before_action :verify_authenticity_token
    def index
        render json: UserTable.all()
    end
    # def login
    #     render json: User
    # end
    def login
        if(params[:id])
            render json: UserTable.find(params[:id])
        elsif(params[:n])
            render json: UserTable.where('user_name LIKE ?',"%#{params[:n]}%")
        else
        render json: UserTable.all()
        end
    end
    def posts
        if(params[:id])
            render json: PostTable.find(params[:id])
        else
            render json: PostTable.all()
        end
    end
    def search
        if(params[:title])
            render json: PostTable.where('title_of_post LIKE ?',"%#{params[:title]}%")
        else
            render json: PostTable.all()
        end
    end
    def editpost
        element=PostTable.find(params[:id])
        element.update(params.permit(:title_of_post,:content))
        render json:element
    end
    def inputpost
        obj =  PostTable.create(params.permit(:title_of_post, :content,:image))
        obj.save()
        render json: obj
    end
    def likes
        count= LikesCalTables.find_all_by_post_table_id(params[:id]).count
        render json: count
    end
end




