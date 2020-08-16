package semantica;


public class RS_If extends RS_base{
    
    private String elseLabel;
    private String exitLabel;
    
    public RS_If(String pElse, String pExit){
        this.elseLabel = pElse;
        this.exitLabel = pExit;
        this.tipoRS = "if";
    }
    
    public RS_If(){
        this.tipoRS = "if";
    }

    public String getElseLabel() {
        return elseLabel;
    }

    public void setElseLabel(String elseLabel) {
        this.elseLabel = elseLabel;
    }

    public String getExitLabel() {
        return exitLabel;
    }

    public void setExitLabel(String exitLabel) {
        this.exitLabel = exitLabel;
    }

    @Override
    public String getTipoRS() {
        return tipoRS;
    }

    @Override
    public void setTipoRS(String tipoRS) {
        this.tipoRS = tipoRS;
    }
    
}
