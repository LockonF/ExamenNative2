<?php
/**
 * Created by PhpStorm.
 * User: LockonDaniel
 * Date: 6/24/14
 * Time: 19:34
 */

class Pregunta {
    private $idPregunta;
    private $oracion;
    private $opc1,$opc2,$opc3,$opc4,$opcc;
    private $justificacion;
    private $grafico;

    static function constructWithParameters($idPregunta,$oracion,$opc1,$opc2,$opc3,$opc4,$opcc,$justificacion,$grafico)
    {
        $pregunta = new Pregunta();
        $pregunta->grafico = $grafico;
        $pregunta->idPregunta = $idPregunta;
        $pregunta->justificacion = $justificacion;
        $pregunta->opc1 = $opc1;
        $pregunta->opc2 = $opc2;
        $pregunta->opc3 = $opc3;
        $pregunta->opc4 = $opc4;
        $pregunta->opcc = $opcc;
        $pregunta->oracion = $oracion;
        return $pregunta;
    }


    /**
     * @param mixed $grafico
     */
    public function setGrafico($grafico)
    {
        $this->grafico = $grafico;
    }

    /**
     * @return mixed
     */
    public function getGrafico()
    {
        return $this->grafico;
    }

    /**
     * @param mixed $idPregunta
     */
    public function setIdPregunta($idPregunta)
    {
        $this->idPregunta = $idPregunta;
    }

    /**
     * @return mixed
     */
    public function getIdPregunta()
    {
        return $this->idPregunta;
    }

    /**
     * @param mixed $justificacion
     */
    public function setJustificacion($justificacion)
    {
        $this->justificacion = $justificacion;
    }

    /**
     * @return mixed
     */
    public function getJustificacion()
    {
        return $this->justificacion;
    }

    /**
     * @param mixed $opc1
     */
    public function setOpc1($opc1)
    {
        $this->opc1 = $opc1;
    }

    /**
     * @return mixed
     */
    public function getOpc1()
    {
        return $this->opc1;
    }

    /**
     * @param mixed $opc2
     */
    public function setOpc2($opc2)
    {
        $this->opc2 = $opc2;
    }

    /**
     * @return mixed
     */
    public function getOpc2()
    {
        return $this->opc2;
    }

    /**
     * @param mixed $opc3
     */
    public function setOpc3($opc3)
    {
        $this->opc3 = $opc3;
    }

    /**
     * @return mixed
     */
    public function getOpc3()
    {
        return $this->opc3;
    }

    /**
     * @param mixed $opc4
     */
    public function setOpc4($opc4)
    {
        $this->opc4 = $opc4;
    }

    /**
     * @return mixed
     */
    public function getOpc4()
    {
        return $this->opc4;
    }

    /**
     * @param mixed $opcc
     */
    public function setOpcc($opcc)
    {
        $this->opcc = $opcc;
    }

    /**
     * @return mixed
     */
    public function getOpcc()
    {
        return $this->opcc;
    }

    /**
     * @param mixed $oracion
     */
    public function setOracion($oracion)
    {
        $this->oracion = $oracion;
    }

    /**
     * @return mixed
     */
    public function getOracion()
    {
        return $this->oracion;
    }


} 