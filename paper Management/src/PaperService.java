import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PaperService {
    private List<Paper> papers;  // Assuming this is  data storage for papers

    public PaperService() {
        this.papers = new ArrayList<>();
    }

    public Paper createPaper(String title, String abstractText, String content, List<String> authors) {
        Paper paper = new Paper();
        paper.setId(generateUniqueId());  // You need to implement this method to generate unique IDs
        paper.setTitle(title);
        paper.setAbstractText(abstractText);
        paper.setContent(content);
        paper.setAuthors(authors);
        paper.setCoAuthors(new ArrayList<>());
        paper.setReviews(new ArrayList<>());
        paper.setState(PaperState.CREATED);
        paper.setCreationDate(LocalDateTime.now());

        // Add the paper to your data storage
        papers.add(paper);

        return paper;
    }

    public void updatePaper(int paperId, String newTitle, String newAbstract, String newContent) {
        Paper paper = getPaperById(paperId);
        if (paper != null) {
            paper.setTitle(newTitle);
            paper.setAbstractText(newAbstract);
            paper.setContent(newContent);
        }
        // Handle the case where the paper with the given ID is not found
    }

    public void submitPaper(int paperId) {
        Paper paper = getPaperById(paperId);
        if (paper != null && paper.getState() == PaperState.CREATED) {
            paper.setState(PaperState.SUBMITTED);
        }
        
    }

    public void assignReviewer(int paperId, User reviewer) {
        Paper paper = getPaperById(paperId);
        if (paper != null && paper.getState() == PaperState.SUBMITTED) {
            paper.getCoAuthors().add(reviewer);
        }
        
    }

    public void reviewPaper(int paperId, Review review) {
        Paper paper = getPaperById(paperId);
        if (paper != null && paper.getState() == PaperState.SUBMITTED) {
            paper.getReviews().add(review);
        }
        
    }
  
    public void makeDecision(int paperId, PaperState decision) {
        Paper paper = getPaperById(paperId);
        if (paper != null && paper.getState() == PaperState.REVIEWED) {
            paper.setState(decision);
        }
        
    }

    public void finalSubmission(int paperId, String updatedContent) {
        Paper paper = getPaperById(paperId);
        if (paper != null && paper.getState() == PaperState.APPROVED) {
            paper.setContent(updatedContent);
        }
        
    }

    private Paper getPaperById(int paperId) {
        return papers.stream().filter(p -> p.getId() == paperId).findFirst().orElse(null);
    }

    private int generateUniqueId() {
        return papers.size() + 1;
    }
}