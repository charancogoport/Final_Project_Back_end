class PagesController< ApplicationController
    
    def index
        render json: UserTable.all()
    end
    # def login
    #     render json: User
    # end
    skip_before_action :verify_authenticity_token
    def create
        render json: UserTable.create(params.permit(:user_name,:password,:email))
    end
    def login
        if(params[:id])
            render json: UserTable.find(params[:id])
        # elsif(params[:n])
            # render json: UserTable.where('user_name LIKE ?',"%#{params[:n]}%")
        else
        render json: UserTable.all()
        end
    end
    def profile
        render json: UserProfileTable.find(user_table_id: params[:id])
    end
    def userposts
        if(params[:id])
            render json: PostTable.find(user_table_id: params[:id])
        else
            render json: PostTable.all()
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
    def increaselike
        render json: LikesTable.create(params.permit(:user_table_id,post_table_id))
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
        PostTable.where(:id => params[:id]).destroy_all
        # render json: del
        # val.destroy()
        # render json: "llll"
    end
    def trending
        # trend = LikesTable.group("post_table_id").order("count").count
        # LikesTable.select("count(*) as Like_count").group("post_table_id").order
        results = ActiveRecord::Base.connection.exec_query("select count(*) as like from likes_tables group by post_table_id order by like desc;")
        # LikesTable.select("count(*) as val").group('post_table_id').order('val desc')
        render json:results
    end
    def userposts
        user_table_id=params[:id]
        posts = ActiveRecord::Base.connection.exec_query("select * from post_tables where user_table_id=?",user_table_id)
        render json:posts
    end
    def saved
        user_table_id=params[:id]
        saved = ActiveRecord::Base.connection.exec_query("select * from post_tables as p join likes_tables as l where l.user_table_id=? and l.status=true",user_table_id)
        render json:saved
    end
    def some
        p.user_table_id=params[:id]
        val=ActiveRecord::Base.connection.exec_query("select u.id,p.id,p.user_table_id,p.title_of_post,p.content,p.image from post_tables as p join user_tables as u on u.id=p.user_table_id where p.user_table_id=?",p.user_table_id)
        render json:val
    end


end




