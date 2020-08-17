package semantica;

public class RS_While extends RS_Base{
    
    private String whileLabel;
    private String exitLabel;
    
    public RS_While(){
        this.tipoRS = "while";
    }
    
    public RS_While(String pWL, String pEL){
        this.exitLabel = pEL;
        this.whileLabel = pWL;
        this.tipoRS = "while";
    }

    public String getWhileLabel() {
        return whileLabel;
    }

    public void setWhileLabel(String whileLabel) {
        this.whileLabel = whileLabel;
    }

    public String getExitLabel() {
        return exitLabel;
    }

    public void setExitLabel(String exitLabel) {
        this.exitLabel = exitLabel;
    }

    public String getTipoRS() {
        return tipoRS;
    }

    public void setTipoRS(String tipoRS) {
        this.tipoRS = tipoRS;
    }
    
    
}
