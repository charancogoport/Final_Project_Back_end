class PagesController< ApplicationController
    
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
    
end