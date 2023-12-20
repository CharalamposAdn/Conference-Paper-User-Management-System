public class PCMember {
    private String userId;

    // Default constructor
    public PCMember() {
    }

    // Parameterized constructor
    public PCMember(String userId) {
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
        return "PCMember{" +
                "userId='" + userId + '\'' +
                '}';
    }
}
