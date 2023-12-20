public class PCChair {
    private String userId;

    // Default constructor
    public PCChair() {
    }

    // Parameterized constructor
    public PCChair(String userId) {
        this.userId = userId;
    }

    // Getter for userId
    public String getUserId() {
        return userId;
    }

    // Setter for userId
    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "PCChair{" +
                "userId='" + userId + '\'' +
                '}';
    }
}
