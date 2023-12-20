import java.util.List;

public class Conference {
    private String conferenceId;
    private String name;
    private String description;
    private String creatorUserId;
    private List<String> pcChairs;
    private List<String> pcMembers;
    private List<String> papers;
    private String state;

    public Conference(String name, String description, String creatorUserId, List<String> pcChairs, List<String> pcMembers, List<String> papers, String state) {
        this.name = name;
        this.description = description;
        this.creatorUserId = creatorUserId;
        this.pcChairs = pcChairs;
        this.pcMembers = pcMembers;
        this.papers = papers;
        this.state = state;
    }

    public String getConferenceId() {
        return conferenceId;
    }

    public void setConferenceId(String conferenceId) {
        this.conferenceId = conferenceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatorUserId() {
        return creatorUserId;
    }

    public void setCreatorUserId(String creatorUserId) {
        this.creatorUserId = creatorUserId;
    }

    public List<String> getPcChairs() {
        return pcChairs;
    }

    public void setPcChairs(List<String> pcChairs) {
        this.pcChairs = pcChairs;
    }

    public List<String> getPcMembers() {
        return pcMembers;
    }

    public void setPcMembers(List<String> pcMembers) {
        this.pcMembers = pcMembers;
    }

    public List<String> getPapers() {
        return papers;
    }

    public void setPapers(List<String> papers) {
        this.papers = papers;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
