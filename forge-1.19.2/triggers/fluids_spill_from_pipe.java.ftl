<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(PipeCollisionEvent.Spill event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "event.getPos().x",
            "y": "event.getPos().y",
            "z": "event.getPos().z",
            "world": "event.getLevel()",
            "blockstate": "event.getState()",
            "dimension": "event.getLevel().dimension()",
            "WorldFluid": "(FluidState) event.getWorldFluid()",
            "PipeFluid": "(FluidState) event.getPipeFluid()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }