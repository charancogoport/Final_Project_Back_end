class PagesController< ApplicationController
    
    def index
        render json: UserTable.all()
    end
    # def login
    #     render json: User
    # end
    skip_before_action :verify_authenticity_token
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
    def createpost
        render json: PostTable.create(params.permit(:user_table_id,:title_of_post,:content,:image))
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
        obj =  PostTable.update(body.permit(:title_of_post, :content,:image)) # user id should be attached to this?
        obj.save()
        render json: obj
    end
    def likes
        # ActiveRecord::Base.connection.tables.map { |t| {t=>  ActiveRecord::Base.connection.execute("select count(*) from #{t}")[0]} }
        # likes = LikesCalTables.where('post_table_id EQUALS TO ?', "#{params[:post_id]}").count
        # like = LikesCalTables.count(:EQUALTO => "post_table_id")
        # like = LikesCalTables.find_all_by_post_table_id(params[:id]).count
        # puts(params[:id])
        like = LikesTable.where(post_table_id: params[:id]).count
        # 'post_table_id EQUALTO ?', "#{params[:post_id]}" 
        render json: like
    end
    
    def deletepost
        # remove_foriegn_key :user_table, :user_table_id
        # SET Foriegn_key_CHECKS=0;
        LikesTable.where(:post_table_id => params[:id]).destroy_all
        # del.destroy()
        # render json: del
        PostTable.where(:id => params[:id]).destroy_all
        # val.destroy()
        # render json: "llll"
    end
    def trending
        # trend = LikesTable.group("post_table_id").order("count").count
        # LikesTable.select("count(*) as Like_count").group("post_table_id").order
        results = ActiveRecord::Base.connection.exec_query("select count(*) as like from likes_tables group by post_table_id order by like desc;")
        render json:results
    end
end




